node{
	def app
  	stage('clone repo'){
    	checkout scm
  	}
 
 	stage('build'){
   	app = docker.build("shashikant-koder/nginx")
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
