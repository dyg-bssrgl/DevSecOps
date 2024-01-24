pipeline {
    agent { label 'windows' }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    stages {
        stage('Build') {
            steps {
                script {
                    bat 'docker build -t dygbssrgl/devsecops:latest .'
                }
            }
        }
        stage('Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dygbssrgl-dockerhub', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                        bat 'del pass.txt'
                        bat 'echo %DOCKERHUB_PASS% >> pass.txt'
                        bat 'script.bat'
						bat 'type pass.txt | docker login --username %DOCKERHUB_USER% --password-stdin'
						bat 'del pass.txt'
                    }
                }
            }
        }
		stage('Push') {
            steps {
                script {
					bat 'docker push dygbssrgl/devsecops:latest'
                }
            }
        }
    }
    post {
        always {
            script {
                bat 'docker logout'
            }
        }
    }
}
