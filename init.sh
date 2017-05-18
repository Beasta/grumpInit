#!/bin/bash
echo "what will the grump be called"
read grumpName
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
echo "creating ${grumpName} shell file"
echo "#!/bin/bash" > ${grumpName}.sh
git init

