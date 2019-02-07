pipeline{
	agent none
	//If Scripted, we need to declare app before we can use it
	environment{
		//def app
		//def tag -> Get git commit hash
		def image = 'myuser/myrepo:latest'
	}
	stages{
		stage('SCM') {
			agent {
				label 'Vagrant_SSH'
			}
			steps{
				checkout scm
			}
		}
		stage('Build'){
			agent {
				label 'Vagrant_SSH'
			}
			steps{
				echo "Running on ${NODE_NAME}"
				//bat 'docker -v'

				//Declarative
				//bat 'docker build -t myuser/myrepo:latest .'
				//Scripted
				//app = docker.build("username/repo")
			}
		}
		stage('Test'){
			agent {
				label 'Vagrant_SSH'
			}
			steps{
				//echo "----"
				//sh 'docker -v'
				
				script{
					docker.image('ubuntu').inside {
						stage('Something'){
							echo "Something"
						}
					}
				}
				
				//Declarative
				//sh 'docker run --rm -it myuser/myrepo:latest bash'
				//sh 'echo "Tests passed"'
				//sh 'exit'
				//Scripted
				//app.inside {
				//	sh 'echo "Tests passed"'
				//}
			}
		}
		/*
		stage('Publish'){
			steps{
				//Declarative
				withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
					//Push with as many tags as you like
					sh 'docker push username/repo:latest'
				}
				//Scripted
				//docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
					//app.push("${env.BUILD_NUMBER}")
					//app.push("latest")
				//}
			}
		}
		stage('Verify'){
			steps{
				//sh 'docker pull username/repo:tag'
			}
		}
		*/
	}
}
