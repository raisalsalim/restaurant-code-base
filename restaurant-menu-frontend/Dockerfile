# Stage 1: Build Stage
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first to leverage cache
COPY package*.json ./

# Install only production dependencies
RUN npm ci --production

# Copy all source files (including app code) into the container
COPY . .

# Build the Next.js app
RUN npm run build

# Stage 2: Production Stage
FROM node:18-alpine AS production

# Set working directory
WORKDIR /app

# Copy only the production dependencies and build output
COPY --from=build /app/node_modules /app/node_modules
COPY --from=build /app/.next /app/.next
COPY --from=build /app/public /app/public
COPY --from=build /app/package.json /app/package.json

# Clean up unnecessary files and directories
RUN rm -rf /app/src /app/tests /app/.git /app/.dockerignore /app/.npmrc /app/node_modules/dev

# Remove npm cache to further reduce image size
RUN npm cache clean --force

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "run", "start"]
