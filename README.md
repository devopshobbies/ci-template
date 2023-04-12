# Simple CI

In this project we aimed to demonstrate how to use different and popular CI/CD tools for a simple Go application.

## Usage

each CI/CD techniques are in a different branch, currenlty the following CI/CD tools are supported, go the appropriate branch of your choice and follow the instruction:

- [Github](https://github.com/devopshobbies/simple-ci/tree/github-ci)

- [Gitlab](https://github.com/devopshobbies/simple-ci/tree/gitlab-ci)

- [Jenkins](https://github.com/devopshobbies/simple-ci/tree/jenkins-ci)

## Jenkins Prerequisite

- docker pull jenkins
- docker run -d -p [your port here]:8080 -v [your host path here]:/var/jenkins_home:z -t jenkins
- Install s plugins.
- Install Jenkins' go plugin.

## Setup The Job

- Create a new pipeline job
- Use github to this repo.
- Pipeline -> Pipeline script from SCM
- SCM Git, pointed at this repo!
- Script file should be Jenkinsfile
