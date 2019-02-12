pipeline{
	agent any

	environment{
		//def tag -> Get git commit hash
		def image = 'ricardomiguel/testing'
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
						sh 'vi --version'
					}
				}
			}
		}
		stage('Publish'){
			steps{
				//Declarative
				/*
				withDockerRegistry([ credentialsId: "Docker_Hub", url: "" ]) {
					//Push with as many tags as you like
					sh 'docker push username/repo:latest'
				}
				*/
				//Scripted
				docker.withRegistry('https://registry.hub.docker.com', 'Docker_Hub') {
					app.push("${env.GIT_COMMIT}")
					app.push("latest")
				}
			}
		}
	}
	post{
		always{
			deleteDir()
		}
		success{
			slackSend color: 'good',message: "${currentBuild.fullDisplayName} - ${image}:${env.GIT_COMMIT} was pushed successfully to Docker Hub\n${env.BUILD_URL}"
		}
		failure{
			slackSend color: 'danger',message: "${currentBuild.fullDisplayName} failed to push to Docker Hub\n${env.BUILD_URL}"
		}
	}
}
