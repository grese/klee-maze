FROM klee/klee:2.0

RUN echo "Building klee-maze image..."

# Install dependencies
RUN sudo apt-get update
RUN sudo apt-get install -y git-core

# Install maze
RUN echo "Installing maze..."
RUN git clone https://github.com/grese/klee-maze.git ~/maze
