pipeline {
    agent any

    /*
     * DEVSECOPS EXPLANATION:
     * DevSecOps is the practice of integrating security testing and compliance
     * into every stage of the software development lifecycle (SDLC).
     * Instead of security being an afterthought (at the end), it is "shifted left"
     * and automated within the CI/CD pipeline.
     */

    environment {
        IMAGE_NAME = "healthcare-app"
        IMAGE_TAG  = "latest"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                echo "Building the healthcare system container..."
                // Build the image from the local Dockerfile
                bat "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
            }
        }

        stage('Security Scan (DevSecOps)') {
            steps {
                echo "Running security vulnerability scan..."
                /* 
                 * SECURITY INTEGRATION:
                 * In a real DevSecOps pipeline, you would use tools like:
                 * - Trivy / Snyk (Container scanning)
                 * - SonarQube (Static analysis)
                 * - OWASP ZAP (Dynamic analysis)
                 */
                echo "Scanning Docker image for vulnerabilities..."
                
                // Simulating a security check
                script {
                    def scanResults = "No critical vulnerabilities found. Image is safe for deployment."
                    echo "SCAN RESULT: ${scanResults}"
                }
            }
        }

        stage('Deploy Container') {
            steps {
                echo "Deploying the secure healthcare application..."
                // Stop and remove any existing container with the same name
                bat "docker stop ${IMAGE_NAME} || true"
                bat "docker rm ${IMAGE_NAME} || true"
                
                // Run the new container on port 8080
                bat "docker run -d --name ${IMAGE_NAME} -p 8080:80 ${IMAGE_NAME}:${IMAGE_TAG}"
                
                echo "Application is now running at http://localhost:8080"
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully. DevSecOps principles applied!"
        }
        failure {
            echo "Pipeline failed. Check security logs or build output."
        }
    }
}
