// 2. Extrai o ano do final do título e cria a propriedade m.year
MATCH (m:Movie)
WHERE m.title =~ '.*\\(\\d{4}\\)'
WITH m, 
     substring(m.title, size(m.title)-5, 4) AS anoStr,
     trim(substring(m.title, 0, size(m.title)-6)) AS tituloLimpo
SET m.year = toInteger(anoStr),
    m.title = tituloLimpo;