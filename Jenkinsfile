pipeline {
    agent { label 'docker-enabled' }
    environment {
	    DOCKER_COMPOSE_FILE = 'docker-compose.yml'
	    GIT_CREDENTIALS = credentials('73906d01-d627-40ef-b7f9-f8e1d4ba925d')
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    dir('backend') {
                        git url: 'https://github.com/fr3ddy-fryd3/aosr-editor.git', branch: 'main', credentialsId: '73906d01-d627-40ef-b7f9-f8e1d4ba925d'
                    }
                    dir('frontend') {
                        git url: 'https://github.com/fr3ddy-fryd3/aosr-front.git', branch: 'main', credentialsId: '73906d01-d627-40ef-b7f9-f8e1d4ba925d'
                    }
		                dir('') {
			                  git url: 'https://github.com/fr3ddy-fryd3/aosr_infra.git', branch: 'main', credentialsId: '73906d01-d627-40ef-b7f9-f8e1d4ba925d'
		                }
                    sh 'ls'
                    sh 'ls jenkins'
                }
            }
        }

        stage('Build') {
            steps {
                sh 'docker-compose build'
            }
        }

        stage('Test') {
            steps {
                sh 'docker-compose up -d db'
                sh 'docker-compose run backend pytest'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose rm -f'
                sh 'docker-compose up -d frontend backend db'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished'
        }
    }
}
