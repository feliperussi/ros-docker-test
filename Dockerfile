FROM ros:humble

RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    && rm -rf /var/lib/apt/lists/*

COPY . /ros2_ws
WORKDIR /ros2_ws

RUN /bin/bash -c "source /opt/ros/humble/setup.bash && colcon build"

CMD ["bash", "-c", "source /opt/ros/humble/setup.bash && source install/setup.bash && ros2 run my_package talker"]
