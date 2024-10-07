pipeline {
    tools {
        maven 'Maven3.8.7'
    }
    agent {
        label 'Agent01'
    }
    environment {
        DOCKER_CREDENTIALS_ID = 'docker_hub_login' //DockerHub credentials in Jenkins
        DOCKER_IMAGE_NAME = 'kassimabdi/tomcat-abc-technologies-app' // DockerHub repo
        DOCKER_TAG = 'latest'
    }
    
    stages {

        stage('Compile') {
            steps {
                sh 'mvn compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_TAG}", '.')
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        def app = docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_TAG}")
                        app.push()
                    }
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh '''
                        docker stop ${DOCKER_IMAGE_NAME} || true
                        docker rm ${DOCKER_IMAGE_NAME} || true
                        docker run -d --name ${DOCKER_IMAGE_NAME} -p 8080:8080 ${DOCKER_IMAGE_NAME}:${DOCKER_TAG}
                    '''
                }
            }
        }
    }

    // post {
    //     always {
    //         // Clean workspace after every build
    //         cleanWs()
    //     }
    //     success {
    //         echo 'Build, Dockerization, and Deployment completed successfully!'
    //     }
    //     failure {
    //         echo 'Build failed. Check logs for details.'
    //     }
    // }
}
