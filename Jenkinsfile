pipeline {
    tools {
        maven 'Maven3.8.7'
    }
     agent {
        label 'Agent01'
    }
    
    stages {
        stage('clone repository from github') {
            steps {
                git branch: 'main', url: 'https://github.com/KassimHomeDev/ABC-Technologies_Edureka_project1.git'
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
