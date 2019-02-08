pipeline{
	agent none

	environment{
		//def tag -> Get git commit hash
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

				//Declarative
				//sh 'docker build -t myuser/myrepo:latest .'

				//Scripted
				script{
					//echo "${env.GIT_COMMIT}"
					app = docker.build("${image}:${env.GIT_COMMIT}")
				}

			}
		}
		stage('Test'){
			agent{
				label 'Vagrant_SSH'
			}
			steps{
				script{
					app.inside {
						sh 'echo "Tests passed"'
					}
				}
			}
			/*
			steps{

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
					//app.push("${tag}")
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
	post{
		always{
			deleteDir()
		}
	}
}
