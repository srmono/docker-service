pipeline {
    agent any 
    stages {
        stage('deploy') { 
            steps {
                sh "mvn package"
            }
        }

        stage('Build Docker image'){
            steps {
              
                sh 'docker build -t  ustapi/docker_service:${BUILD_NUMBER} .'
            }
        }

        stage('Docker Login'){
            
            steps {
                 withCredentials([string(credentialsId: 'DockerId', variable: 'Dockerpwd')]) {
                    sh "docker login -u ustapi -p ${Dockerpwd}"
                }
            }                
        }

        stage('Docker Push'){
            steps {
                sh 'docker push ustapi/docker_service:${BUILD_NUMBER}'
            }
        }
        
        stage('Docker deploy'){
            steps {
               
                sh 'docker run -itd -p  8085:8085 ustapi/docker_service:${BUILD_NUMBER}'
            }
        }

        
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}

