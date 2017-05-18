#!/bin/bash
echo "what will the grump be called?"
read grumpName
if [ -d "${grumpName}" ]; then
    echo "there is a already a directory with that name"
    exit 1
fi
echo "Briefly describe the grump's function"
read grumpDescription
echo "creating a folder called ${grumpName} for the grump"
mkdir -p ${grumpName} && cd $_;
echo "creating a grump.json"
cat >grump.json <<EOL
{
  "defaultCommand": "${grumpName}",
  "commands": {
    "${grumpName}": {
      "scriptType": "bash",
      "scriptPath": "${grumpName}.sh",
      "vars": {}
    }
  }
}
EOL
echo "creating a readme"
cat >README.md <<EOL

# ${grumpName}
${grumpDescription}

If grump has not yet been installed, you can do so using:
\`\`\`bash
npm i -g grump
\`\`\`

Example usage:
\`\`\`
grump ${grumpDescription}
\`\`\`

see [grumpJS.com](https://grumpjs.com) to find other useful grumps!
EOL
echo "creating ${grumpName} shell file"
echo "#!/bin/bash" > ${grumpName}.sh
git init

