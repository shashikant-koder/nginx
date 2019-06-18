pipeline{
   agent any
	stages{
	  	stage("clone repo"){
			steps{
				git credentialsId: 'git', url: 'https://github.com/shashikant-koder/nginx'
			}
  		}
		stage("build"){
			steps{
				sh 'docker build -t myimage .' 
			}
  		}
		stage("test"){
			steps{
				sh 'echo "testing passsed"' 
	   		}
		}

		stage("push"){
			steps{
				docker.withRegistry('https://registry.hub.docker.com','docker-hub-credentials'){
					app.push("${env.BUILD_NUMBER}")
					app.push("latest")
				}
			}
  		}

	}	
}
