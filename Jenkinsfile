pipeline {
    agent { label 'windows' }
    options {
        buildDiscarder(logRotator(numToKeepStr: '5'))
    }
    stages {
        stage('Build') {
            steps {
                script {
                    bat 'docker build -t dygbssrgl/devsecops:%BUILD_NUMBER% .'
					bat 'echo a >> build.txt'
					bat 'del build.txt'
					bat 'echo %BUILD_NUMBER%>>build.txt'
					bat 'script2.bat'
					bat 'script3.bat BUILD_NUMBER %BUILD_NUMBER%'
                }
            }
        }
        stage('Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dygbssrgl-dockerhub', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
						bat 'echo a >> pass.txt'
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
					bat 'docker push dygbssrgl/devsecops:%BUILD_NUMBER%'
                }
            }
        }
		stage('Deploy to Kubernetes') {
			steps {
				script {
					withCredentials([file(credentialsId: 'k8s-kubeconfig', variable: 'KUBECONFIG')]) {
						bat "kubectl apply -f my-kubernetes-deployment.yaml"
						bat 'kubectl apply -f my-app-service.yaml'
						bat 'kubectl apply -f kube-state-metrics.yaml'
						bat 'kubectl apply -f proac.yaml'
						bat 'kubectl apply -f node-exporter.yaml'
						bat 'kubectl apply -f prometheus.yaml'
						bat 'kubectl apply -f prometheus-pods.yaml'
						bat 'kubectl apply -f prometheus-service.yaml'
						bat 'kubectl apply -f grafana-config.yaml'
						bat 'kubectl apply -f grafana.yaml'
					}
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

