node{
	agent {
    label 'master'
  }
	def app
  	stage('clone repo'){
    	git credentialsId: 'git', url: 'https://github.com/shashikant-koder/nginx'
  	}
 
 	stage('build'){
   	sh 'docker ps' 
  	}
	stage('test'){
		app.inside{
			sh 'echo "testing passsed"' 
	   	}
	}

	stage('push'){
		docker.withRegistry('https://registry.hub.docker.com','docker-hub-credentials'){
			app.push("${env.BUILD_NUMBER}")
			app.push("latest")
		}
  	}
}
