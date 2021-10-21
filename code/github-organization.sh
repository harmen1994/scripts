#!/bin/bash
echo "Please input Personal Access Token from Github"
read -sp 'PAT: ' TOKEN
echo "Please input your Organization name in Github"
read -sp 'Organization: ' ORG
echo ""
echo "Fetching repos for organization $ORG "
mkdir -p $HOME/github.com/$ORG
cd $HOME/github.com/$ORG

curl -s https://$TOKEN:@api.github.com/orgs/$ORG/repos\?per_page\=200 | jq '.[].html_url' | xargs -n 1 git clone
