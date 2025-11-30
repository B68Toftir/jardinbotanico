<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match="/jardinBotanico/plantas">
    
<!--
  Autor : Carles Rodriguez i Rovira
  Asignatura : LMGSI
  Unidad UD 4
  Tarea : TaEv 02 - XSLT
  Ver website : https://b68toftir.github.io/jardinbotanico/
  Fecha : 2025-12-01
-->
    
  <html lang="es">

	<head>
		<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
		<meta charset="utf-8"/>
		<meta name="description" content="Página principal" />
		<title>titulo de la web</title>
	</head>

	<body>
		<header>
			<img src= "../img/logotipo.png" alt= "Reservas" />
			<a href="zonas.xml">Zonas</a>
			<a href="plantas.xml">Plantas</a>
			<a href="actividades.xml">Actividades</a>
		</header>
		
		<main id="jardinbotanico">
			<h1>PLANTAS</h1>
      <!-- Muestra las plantas que hay en el xml -->
      <xsl:apply-templates select="planta"/>
		</main>

		<footer>
			<address>&#169; Desarrollado por info@birt.eus</address>
		</footer>
	</body>
</html>
</xsl:template>
  
<!-- TEMPLATE para no mostrar info que no sea de plantas -->
<xsl:template match="zonas | actividades"/>
<xsl:template match="text()"/>
  
<!-- TEMPLATE PARA CADA PLANTA -->
<!-- Uso un xsl:if para constrolar la luminosidad -->
<xsl:template match="planta">
  <article class="articulo">
    <img class="imagen" src="../img/{@foto}" alt="{nombreComun}"/>
    <h2>
      <a href="https://es.wikipedia.org/wiki/{@familia}" target="_blank">
        <xsl:value-of select="nombreComun"/>
      </a>
    </h2>
    <h3>        
      <xsl:if test="luminosidad = 'Alta'">
        <img src="../img/Alta.png" class="alta-icono"/>Alta
      </xsl:if>
      <xsl:if test="luminosidad = 'Baja'">
        Baja
      </xsl:if>
    </h3>
  </article>
</xsl:template>  

</xsl:stylesheet>