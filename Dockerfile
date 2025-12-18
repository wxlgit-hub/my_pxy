FROM node:20-alpine

# 1. 设置工作目录为 /app (不要用 /tmp，/tmp 重启会清空且通常用于临时文件)
WORKDIR /app

# 2. 先复制 package.json 安装依赖
COPY package*.json ./
RUN npm install

# 3. 复制所有源代码到当前工作目录 (/app)
COPY . .

# 4. 暴露端口 (假设是 3000)
EXPOSE 3000

# 5. 启动命令。注意：这里不需要写绝对路径，因为它会在 WORKDIR 下寻找
# 确保你的项目根目录下真的有一个 index.js 文件
CMD ["node", "index.js"]
