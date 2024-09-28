pipeline {
    tools {
        maven 'Maven3.8.7'
    }
    agent any
    
    stages {
        stage('clone repository from github') {
            steps {
                git branch: 'main', url: 'https://github.com/KassimHomeDev/final-devops-project-edureka.git'
            }
        }

        stage('compile') {
            steps {
                sh 'mvn compile'
            }
        }
        stage('test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('package') {
            steps {
                sh 'mvn package'
            }
        }
    
  }

}
