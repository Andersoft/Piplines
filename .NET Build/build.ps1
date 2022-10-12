docker run -it -d --name pipeline generic-pipeline:net6.0
docker exec pipeline pwsh /Stages/Build/01_clone.ps1 -git_url https://github.com/Andersoft/surveyor
docker exec pipeline pwsh /Stages/Build/02_build.ps1
docker exec pipeline pwsh /Stages/Build/03_test.ps1
docker exec pipeline pwsh /Stages/Build/04_archive.ps1
docker cp pipeline:/artifacts/ ./artifacts
docker stop pipeline
docker rm pipeline