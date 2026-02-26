# 使用轻量级的 Python 3.11 镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 将当前目录下的所有文件复制到容器的 /app 目录中
COPY . /app

# 设置时区
ENV TZ=Asia/Shanghai

# 安装项目运行必需的 Python 库包
RUN pip install --no-cache-dir flask requests gunicorn

# 暴露 Flask 运行的端口
EXPOSE 5001

# 使用 Gunicorn 启动后端服务
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:5001", "app:app"]
