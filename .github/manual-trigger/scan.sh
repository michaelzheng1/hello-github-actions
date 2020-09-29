#!/bin/bash

generate_post_data() {
cat <<EOF
{
  "event_type": "scan-audit",
  "client_payload": {
    "dev": "true",
    "test": "false",
  }
}
EOF
}

# curl \
#   -X POST \
#   -H "Accept: application/vnd.github.v3+json" \
#   https://api.github.com/repos/octocat/hello-world/dispatches \
#   -d '{"event_type":"event_type"}'

echo "$(generate_post_data)"

curl \
    -X POST \
    -H "Accept:application/vnd.github.v3+json" \
    https://api.github.com/repos/michaelzheng1/hello-github-actions/dispatches \
    --data "$(generate_post_data)"

# curl \
#     -X POST \
#     -H "Accept:application/vnd.github.v3+json" \
#     -H "Content-Type:application/json" \
#     https://api.github.com/repos/michaelzheng1/hello-github-actions/dispatches \
#     --data "$(generate_post_data)"


# https://github.com/michaelzheng1/hello-github-actions/actions
echo -e "\nAction has been triggered!"
