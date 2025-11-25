-- NOTE: Replace $PROJECT_DIR with your local path where penguin_data.csv is located.
\copy penguins FROM '{$PROJECT_DIR}/penguin_data.csv' DELIMITER ',' CSV HEADER;
