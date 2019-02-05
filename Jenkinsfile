pipeline{
	agent any
	//If Scripted, we need to declare app before we can use it
	environment{
		def app
		//def tag -> Get git commit hash
		def image = "myuser/myrepo:latest"
	}
	stages{
		stage('SCM') {
			steps{
				checkout scm
			}
		}
		stage('Build'){
			steps{
				//Declarative
				sh 'docker build -t ${image} .'
				//Scripted
				//app = docker.build("username/repo")
			}
		}
		stage('Test'){
			steps{
				sh 'docker run --rm -it ub bash'
				sh 'echo "Tests passed"'
				sh 'exit'
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
				//withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
					//Push with as many tags as you like
					//sh 'docker push username/repo:latest'
				//}
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
	post{
		always{
			deleteDir()
		}
		success{
			slackSend color: 'good', message: "SUCCESS: ${currentBuild.fullDisplayName}\n${image} pushed successfully to Docker Hub"
		}
		failure{
			slackSend color: 'danger', message: "FAILURE: ${currentBuild.fullDisplayName}\nSomething went wrong pushing to Docker Hub\nFailed On: ${FAILED_STAGE}"
		}
	}
}
