# Go CI Templates

## Github

## Gitlab

## Jenkins

### Prerequisite

- docker pull jenkins
- docker run -d -p [your port here]:8080 -v [your host path here]:/var/jenkins_home:z -t jenkins
- Install recommended plugins.
- Install Jenkin's `go`, `Credentials Binding` plugins.

### Setup The Job

- Create a new pipeline job
- Use github to this repo.
- Pipeline -> Pipeline script from SCM
- SCM Git, pointed at this repo!
- Script file should be Jenkinsfile
