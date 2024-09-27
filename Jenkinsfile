pipeline{
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage("Build Maven"){
            steps{
                script{
                    checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/fahad-ui/devops-automation']])
                    bat 'mvn clean install'
                }
            }
        }
        stage("Build Docker Image"){
            steps{
                script{
                    bat 'docker build -t fahadukhan/devops-automation-0.0.1-snapshot .'
                }
            }
        }
        stage("Push Image to Docker Hub"){
            steps{
                script {
                  withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                     bat '''
                        echo %dockerhubpwd% | docker login -u fahadukhan --password-stdin
                         docker build -t fahadukhan/devops-automation-0.0.1-snapshot .
                        docker push fahadukhan/devops-automation-0.0.1-snapshot
                        '''
                    }
                }
            }
        }
    }
}