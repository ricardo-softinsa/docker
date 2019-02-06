pipeline{
	agent any
	//If Scripted, we need to declare app before we can use it
	environment{
		//def app
		//def tag -> Get git commit hash
		def image = 'myuser/myrepo:latest'
	}
	stages{
		stage('SCM') {
			steps{
				checkout scm
			}
		}
		stage('Build'){
			steps{
				//echo "Running on ${NODE_NAME}"
				//bat 'docker -v'
				//Declarative


				//ERROR: The docker-machine doesn't seem to be running on jenkins, try to start the machine and run docker commands...


				bat 'docker-machine start default'
				//bat 'docker build -t myuser/myrepo:latest .'
				//Scripted
				//app = docker.build("username/repo")
			}
		}
		stage('Test'){
			steps{
				echo "feweffew"
				//sh 'winpty docker run --rm -it ubuntu:14.04 bash'
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
}
