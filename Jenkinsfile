pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Abylai'
        STUDENT_SURNAME = 'Zhumabek'
        STUDENT_GROUP   = 'IT2-2306'
        STUDENT_ID      = '38304'
        IMAGE_NAME      = 'zhumabek-abylai-devops'
        CONTAINER_NAME  = 'zhumabek-abylai-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'echo "Git commit used by Jenkins:" && git log -1 --oneline'
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x scripts/*.sh'
                sh './scripts/Zhumabek_Abylai_system.sh'
            }
        }

        stage('Test') {
            steps {
                sh './scripts/test.sh'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
                sh 'docker images $IMAGE_NAME'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
                sh '''
                    docker run -d \
                      -e STUDENT_NAME=$STUDENT_NAME \
                      -e STUDENT_SURNAME=$STUDENT_SURNAME \
                      -e STUDENT_GROUP=$STUDENT_GROUP \
                      -e STUDENT_ID=$STUDENT_ID \
                      --name $CONTAINER_NAME \
                      $IMAGE_NAME
                '''
                sh 'sleep 3 && docker logs $CONTAINER_NAME'
                sh 'docker ps --filter name=$CONTAINER_NAME'
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully!' }
        failure { echo 'Pipeline failed. Check the stage logs above.' }
    }
}
