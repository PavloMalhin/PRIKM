pipeline {
    agent any

    stages {
        stage('Start') {
            steps {
                echo 'Lab_2: started by GitHub'
            }
        }

        stage('Image build') {
            steps {
                sh "docker build -t prikm:latest ."
                sh "docker tag prikm pavlomalhin/prikm:latest"
                sh "docker tag prikm pavlomalhin/prikm:$BUILD_NUMBER"
            }
        }

        stage('Push to registry') {
            steps {
                withDockerRegistry([ credentialsId: "dockerhub_token", url: "" ])
                {
                    sh "docker push pavlomalhin/prikm:latest"
                    sh "docker push pavlomalhin/prikm:$BUILD_NUMBER"
                }
            }
        }

        stage('Deploy image'){
            steps{
                sh "docker stop \$(docker ps -q) || true"
                sh "docker container prune --force"
                sh "docker image prune --force"
                sh "docker run -d -p 80:80 pavlomalhin/prikm"
            }
        }
    }  
}