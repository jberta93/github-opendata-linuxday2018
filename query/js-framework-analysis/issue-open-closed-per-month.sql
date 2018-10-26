SELECT event, repo.id, repo.name, COUNT(*) as count FROM (
  SELECT JSON_EXTRACT(payload, '$.action') as event, repo.id, repo.name
  FROM [githubarchive:month.201809]
  WHERE type = 'IssuesEvent' AND
  (repo.id = 11730342 OR repo.id = 24195339 OR repo.id = 10270250 OR repo.id = 1801829 OR repo.id = 2126244)
)
WHERE event = '"closed"' OR event = '"opened"' OR event = '"reopened"'
GROUP BY event, repo.id, repo.name
ORDER BY repo.id
