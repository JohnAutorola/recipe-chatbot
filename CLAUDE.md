# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Running the Application
- **Start the web application**: `uvicorn backend.main:app --reload`
  - Serves the FastAPI backend with auto-reload on code changes
  - Frontend accessible at `http://127.0.0.1:8000`
  - API endpoint available at `/chat` for chatbot interactions

### Testing and Evaluation
- **Run bulk testing**: `python scripts/bulk_test.py`
  - Tests chatbot responses against queries in `data/sample_queries.csv`
  - Outputs timestamped results to `results/` directory
  - Use `--csv path/to/file.csv` to test with different query sets
  - Requires CSV with `id` and `query` columns

### Dependencies
- **Install requirements**: `pip install -r requirements.txt`
- **Key dependencies**: FastAPI, uvicorn, litellm, python-dotenv, httpx, rich, pandas

## Architecture Overview

### Backend Structure (`backend/`)
- **`main.py`**: FastAPI application with `/chat` endpoint and static file serving
- **`utils.py`**: LLM wrapper using litellm, environment configuration, and agent response logic
- **`prompts.py`**: Contains the `SYSTEM_PROMPT` constant that defines the chatbot's personality and behavior

### Frontend (`frontend/`)
- **`index.html`**: Complete single-page chat interface with markdown rendering
- Uses marked.js for rendering assistant responses as markdown
- Implements typing indicators and modern chat UI patterns

### Data and Testing (`data/`, `scripts/`)
- **Query datasets**: CSV files with test queries for evaluation
- **Bulk testing**: Concurrent testing framework with rich console output
- **Results storage**: Timestamped CSV outputs for response analysis

### Key Integration Points
- **LLM Configuration**: Set via `.env` file with `MODEL_NAME` and appropriate API keys
- **System Prompt**: Centralized in `prompts.py`, automatically injected into conversations
- **Message Flow**: Full conversation history maintained and passed through litellm
- **Error Handling**: Graceful degradation with user-friendly error messages

### Environment Configuration
- Uses python-dotenv for environment variable loading
- Supports multiple LLM providers through litellm (OpenAI, Anthropic, etc.)
- Model selection via `MODEL_NAME` environment variable with provider prefixes

## Course Context
This is a foundational project for an AI Evals course focusing on:
- Crafting effective system prompts for recipe chatbots
- Building comprehensive test datasets for evaluation
- Iterative improvement of chatbot personality and capabilities
- Performance evaluation through bulk testing methodologies