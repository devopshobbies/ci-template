// https://mattermost.com/blog/how-to-set-up-a-jenkins-ci-cd-pipeline-for-your-golang-app/
// https://www.codurance.com/publications/2019/05/30/accessing-and-dumping-jenkins-credentials

pipeline {
    // Run on an agent where we want to use Go
    agent any

    triggers {
        pollSCM '* * * * *'
    }

    // Ensure the desired Go version is installed for all stages,
    // using the name defined in the Global Tool Configuration
    tools { go '1.20' }

    // setup golang environemt
    environment {
        GO114MODULE = 'on'
        CGO_ENABLED = 0 
        GOPATH = "${JENKINS_HOME}/jobs/${JOB_NAME}/builds/${BUILD_ID}"
    }

    stages {
        stage("Lint") {
            steps {
                echo 'LINT EXECUTION STARTED'

                sh '''
                go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
                go mod download
                golangci-lint version
                '''

                try{
                    sh "golangci-lint run"
                } catch (err){
                    sh "the lint has been failed, see reports"
                }
            }
        }
        stage("Test") {
            steps {
                echo 'TEST EXECUTION STARTED'

                sh '''
                go test --race -gcflags=-l -v -coverprofile coverage.out ./...
                go tool cover -func coverage.out
                '''
            }
        }
        stage('Build') {
            steps {
                echo 'BUILD EXECUTION STARTED'

                sh '''
                cd myapp
                pip install -r requirements.txt
                '''

                sh 'go version'
                sh 'go get ./...'
                sh 'docker build . -t devopshobbies/simple-ci'
            }
        }
        stage('Release') {
            steps {
                echo 'RELEASE EXECUTION STARTED'

                // you have to create credentials of the type 'usernamePassword' for dockerhub
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
                    sh 'docker push devopshobbies/simple-ci'
                }
            }
        }
        stage('Archive') {
            archiveArtifacts 'coverage.out'
        }
}
