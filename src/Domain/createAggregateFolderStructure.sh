#!/bin/bash
# Generated with Claude.ai

# Check if aggregate name is provided
if [ -z "$1" ]; then
    echo "Error: Please provide an aggregate name"
    echo "Usage: ./createAggregateFolderStructure.sh AggregateName"
    exit 1
fi

# Convert first letter to uppercase
AGGREGATE_NAME="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"

# Base directory for the aggregate
BASE_DIR="./$AGGREGATE_NAME"

# Create directory structure
mkdir -p "$BASE_DIR"/{Aggregate,Entity,ValueObject,Event,Exception,Repository}

# Create the aggregate root file
AGGREGATE_FILE="$BASE_DIR/Aggregate/$AGGREGATE_NAME.php"
cat > "$AGGREGATE_FILE" << EOF
<?php

declare(strict_types=1);

namespace Cryptobook\\Domain\\$AGGREGATE_NAME\\Aggregate;

final class $AGGREGATE_NAME
{
    public function __construct()
    {
        // TODO: Implement constructor
    }
}
EOF

# Create a .gitkeep file in empty directories to ensure they're tracked by git
touch "$BASE_DIR/Entity/.gitkeep"
touch "$BASE_DIR/ValueObject/.gitkeep"
touch "$BASE_DIR/Event/.gitkeep"
touch "$BASE_DIR/Exception/.gitkeep"

echo "✅ DDD structure for $AGGREGATE_NAME has been created successfully!"
echo "
Created structure:
$BASE_DIR/
├── Aggregate/
│   └── $AGGREGATE_NAME.php
├── Entity/
├── ValueObject/
├── Event/
├── Exception/"