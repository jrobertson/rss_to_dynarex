<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

  xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0"

  xmlns:content = "http://purl.org/rss/1.0/modules/content/"

	  xmlns:feed="http://www.w3.org/2005/Atom"

	xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"	

	xmlns:purl="http://purl.org/rss/1.0/"

	xmlns:rss="http://purl.org/rss/1.0/"

	exclude-result-prefixes="xsl feed rdf purl dc">



	<xsl:output

		method="xml"

		indent="yes"

		omit-xml-declaration="no"

		encoding="UTF-8"

	/>





<xsl:template match="/feed:feed | /rss/channel | /rdf:RDF">

	<xsl:element name="channel">

		

    <xsl:element name="summary">
      <xsl:element name="recordx_type">dynarex</xsl:element>
      <xsl:element name="format_mask">[!link] [!title] [!date] [!description]</xsl:element>
      <xsl:element name="schema">channel[recordx_type, format_mask, title,  description, link]/item(link, title, date, description)</xsl:element>
      <xsl:element name="title">
        <xsl:value-of select="feed:title | purl:channel/purl:title | title"/>
      </xsl:element>
      <xsl:element name="description">

      	<xsl:value-of select="description"/>
      </xsl:element>
      <xsl:element name="link">
      	<xsl:value-of select="link"/>
      </xsl:element>

    </xsl:element>



    <xsl:element name="records">

      <xsl:apply-templates select="item | purl:item | feed:entry | rdf:RDF/rss:item" />

    </xsl:element>
  </xsl:element>

</xsl:template>





<xsl:template match="item | purl:item | feed:entry | rdf:RDF/rss:item">



  <xsl:element name="item">

    <xsl:element name="link">

	    <xsl:value-of select="feed:link/@href | purl:link | link"/>
    </xsl:element>
    <xsl:element name="title">

	    <xsl:value-of select="title | purl:title | feed:title" />

    </xsl:element>

    <xsl:element name="date">

      <xsl:value-of select="feed:date | purl:date | dc:date | pubDate"/>
    </xsl:element>

    <xsl:element name="description">
      <xsl:value-of disable-output-escaping="no" select="description | purl:description | feed:content"/>
    </xsl:element>
  </xsl:element>


</xsl:template>


</xsl:stylesheet>
