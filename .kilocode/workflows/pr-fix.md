I received a review by an AI agent on my Pull Request that I would like help addressing. Note that the review comments can also be wrong or misguided, so always verify if the comment is valid before making any changes.

## Steps

1. Find and read the correct Pull Request using `mcp--github--list_pull_requests` or `mcp--github--pull_request_read`.
2. Analyze each unresolved review comment.
3. For each comment:
   - Verify if the comment is valid by checking the relevant code sections and thinking about the context.
   - If valid, plan the necessary changes.
   - Implement the changes.
4. After making changes, run any necessary linters or tests to ensure code quality.
5. Summarize the changes made in response to the review comments.
