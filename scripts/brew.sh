#!/bin/bash
while IFS= read -r line; do
	brew install "$line"
done <ensure_installed
