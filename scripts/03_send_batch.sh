#!/usr/bin/env bash
# TODO testear si el upload a un bucket efectivamente funciona

if [[ $# -eq 0 ]]; then
    echo "Usage: ${0} url folder [folder...]"
    exit 1
fi

if [[ $# -lt 2 ]]; then
    echo "Incorrect usage: ${0} url folder [folder...]"
    exit 1
fi

folder="/tmp/bri_lab_docs/"
mkdir -pv ${folder}
url="${1}"; shift

echo "STARTING"
i=1
for dir in "${@}"; do
    for file in "${dir}"/*.pdf; do
        repeated=true
        while ${repeated}; do
            name="$(tr -cd 'a-f0-9' </dev/random | head -c 16).pdf"
            unique_name="${folder}/${name}"
            [[ ! -f "${unique_name}" ]] && repeated=false
        done
        echo "${i}: ${file} -> ${name}"
        touch "${unique_name}"
        (echo -n "{\"filename\":\"${name}\",\"data\":\"" && \
            base64 "${file}"; \
            echo "\"}") | \
            curl -H "Content-Type:application/json" -d @- \
            "${url}/files/_doc?pipeline=attachment" >/dev/null 2>&1
        # https://cloud.google.com/storage/docs/uploading-objects#rest-upload-objects
        curl -X POST --data-binary @"${file}" \ #>/dev/null 2>&1 \
            -H "Authorization: Bearer ${OAUTH2_TOKEN}" \
            -H "Content-Type: application/pdf" \
            "https://storage.googleapis.com/upload/storage/v1/b/${BUCKET_NAME}/o?uploadType=media&name=${name}"
        i=$((i + 1))
    done
done
echo "DONE"
