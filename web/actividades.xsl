<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
<xsl:template match="/jardinBotanico/actividades">
<html lang="es">   
      
  <!-- Variable para el mes -->
  <xsl:variable name="mes" select="'11'"/>  
    
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
    
    <main>
      <h1>Actividades del mes <xsl:value-of select="$mes"/></h1>
          
      <!-- Aplicamos la TEMPLATE de actividades descendentemente --> 
      <xsl:apply-templates select="actividad[substring(fechaHora, 6, 2) = $mes]">
        <xsl:sort select="fechaHora" order="descending"/>
      </xsl:apply-templates>
    </main>
    
    <footer>
      <address>&#169; Desarrollado por info@birt.eus</address>
    </footer>
  </body>
</html>
</xsl:template>
  
<!-- TEMPLATE para no mostrar info que no sea de actividades -->
<xsl:template match="zonas | plantas"/>
<xsl:template match="text()"/>
  
<!-- TEMPLATE para cada actividad del mes que escojamos -->
<!-- Uso un <xsl:choose> para saber si es 1 o mas responsables -->
<xsl:template match="actividad">
  <article class="actividades">
    <h4>
      <xsl:value-of select="titulo"/> - <xsl:value-of select="count(responsables/responsable)"/>
      <xsl:choose>
        <xsl:when test="count(responsables/responsable) = 1">
          RESPONSABLE
        </xsl:when>
        <xsl:otherwise>
          RESPONSABLES
        </xsl:otherwise>
      </xsl:choose>
    </h4>
    
    <h2>Fecha: <xsl:value-of select="substring(fechaHora, 1, 10)"/></h2>
    <h2>Hora: <xsl:value-of select="substring(fechaHora, 12, 5)"/></h2>
    <h2>Lugar: <xsl:value-of select="@sala"/></h2>
    <ul>
      <xsl:apply-templates select="responsables/responsable"/>
    </ul>
  </article>
</xsl:template>

<!-- TEMPLATE para la relacion de responsables de la actividad -->
<xsl:template match="responsable">
  <li>
    <xsl:value-of select="nomresponsable"/>
    <xsl:text> - </xsl:text>
    <xsl:value-of select="email"/>
  </li>
</xsl:template>

</xsl:stylesheet>