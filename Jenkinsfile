pipeline {
    agent { label 'docker-enabled' }
    environment { DOCKER_COMPOSE_FILE = 'docker-compose.yml' }
    stages {
        stage('Checkout') {
            steps {
                script {
                    dir('backend') {
                        git url: 'https://github.com/fr3ddy-fryd3/aosr-editor.git', branch: 'dev'
                    }
                    dir('frontend') {
                        git url: 'https://github.com/fr3ddy-fryd3/aosr-front.git', branch: 'dev'
                    }
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
                sh 'docker-compose run backend pytest'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished'
        }
    }
}
