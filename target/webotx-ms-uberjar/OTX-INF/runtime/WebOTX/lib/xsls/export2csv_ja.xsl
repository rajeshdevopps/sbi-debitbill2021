<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method = "text" encoding="Shift_JIS"/>


<xsl:template match="/">
<xsl:apply-templates select="nec-webotx/env"/>
<xsl:apply-templates select="nec-webotx"/>
</xsl:template>

<xsl:template match="nec-webotx">
属性名,設定値,import,CLIName<xsl:for-each select="mbean">
"<xsl:value-of select="./descriptor/field[@name='node']/@value"/>","","1"<xsl:for-each select="./attribute">
"<xsl:value-of select="./descriptor/field[@name='displayname']/@value"/>","<xsl:call-template name="replace">
	<xsl:with-param name="str" select="./descriptor/field[@name='value']/@value"/>
	<xsl:with-param name="match" select="'&quot;'" />
	<xsl:with-param name="replace" select="'&quot;&quot;'" />
</xsl:call-template>","1","<xsl:value-of select="./descriptor/field[@name='CLIName']/@value"/>"</xsl:for-each>
""
</xsl:for-each>
</xsl:template> 

<xsl:template match="env">ENVIRONMENT
<xsl:for-each select="./field">
<xsl:value-of select="@name"/>,"<xsl:value-of select="@value"/>"
</xsl:for-each>
</xsl:template>

<xsl:template name="replace">
<xsl:param name="str"/>
<xsl:param name="match"/>
<xsl:param name="replace"/>
<xsl:choose>
	<xsl:when test="contains($str,$match)"
	><xsl:value-of select="substring-before($str,$match)"
	/><xsl:value-of select="$replace"
		/><xsl:call-template name="replace">
			<xsl:with-param name="str" select="substring-after($str,$match)"/>
			<xsl:with-param name="match" select="$match"/>
			<xsl:with-param name="replace" select="$replace"/>
		</xsl:call-template></xsl:when>
	<xsl:otherwise><xsl:value-of select="$str"/></xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>
