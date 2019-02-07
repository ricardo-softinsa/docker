pipeline{
	agent none
	//If Scripted, we need to declare app before we can use it
	environment{
		//def app
		//def tag -> Get git commit hash
		def tag = $(git log -1 --pretty=%H)
		def image = 'myuser/myrepo'
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
				//echo "Running on ${NODE_NAME}"
				//bat 'docker -v'
				//Declarative
				//sh 'docker build -t myuser/myrepo:latest .'
				//Scripted
				script{
					app = docker.build("${image}:${tag}")
				}
			}
		}
		stage('Test'){
			agent{
				label 'Vagrant_SSH'
			}
			steps{
				script{
					echo "${tag}"
					app.inside {
						sh 'echo "Tests passed"'
					}
				}
			}
			/*
			steps{
				sh 'ls'
				//sh 'vim --version'



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
			*/
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
