SELECT repo.name, repo.id, COUNT(*) as totalIssue FROM (
  SELECT JSON_EXTRACT(payload, '$.issue.id') as idissue, repo.id, repo.name
  FROM
  [githubarchive:month.201801],
  [githubarchive:month.201802],
  [githubarchive:month.201803],
  [githubarchive:month.201804],
  [githubarchive:month.201805],
  [githubarchive:month.201806],
  [githubarchive:month.201807],
  [githubarchive:month.201808],
  [githubarchive:month.201809],
  [githubarchive:month.201810]
  WHERE type = 'IssuesEvent' AND
  (repo.id = 11730342 OR repo.id = 24195339 OR repo.id = 10270250 OR repo.id = 1801829 OR repo.id = 2126244)
  GROUP BY idissue, repo.id, repo.name
)
GROUP BY repo.name, repo.id
ORDER BY totalIssue
