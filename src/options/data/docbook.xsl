<?xml version="1.0"?>
<schema xmlns="http://www.w3.org/2001/XMLSchema"
        targetNamespace="http://docbook.org/ns/docbook"
        xmlns:doc="http://docbook.org/ns/docbook"
		elementFormDefault="qualified">

	<element name="article" type="doc:article" />
	<!-- Further document type definitions
	<element name="book"    type="doc:book" />
	-->

	<!--
		 Document structure
	-->
	<complexType name="article">
		<choice>
			<element name="section" minOccurs="0" maxOccurs="unbounded" type="doc:section" />
			<sequence>
				<choice minOccurs="0" maxOccurs="unbounded">
					<group ref="doc:block" />
				</choice>
			</sequence>
		</choice>
	</complexType>

	<complexType name="section">
		<sequence>
			<element name="sectioninfo" minOccurs="0" type="doc:sectioninfo" />
			<element name="title"    type="doc:inline" />
			<element name="subtitle" type="doc:inline" minOccurs="0" />
			<choice minOccurs="0" maxOccurs="unbounded">
                <element name="section"       type="doc:section" />
				<group ref="doc:block" />
			</choice>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="sectioninfo">
		<sequence minOccurs="0" maxOccurs="unbounded">
			<choice>
                <element name="abstract">
					<complexType>
						<sequence maxOccurs="unbounded">
							<element name="para" type="doc:inline" />
						</sequence>
					</complexType>
				</element>
                <element name="releaseinfo" type="string" />
                <element name="date"        type="string" />
                <element name="pubdate"     type="string" />
				<!-- @TODO: Not really following the docbook standard yet: -->
                <element name="authors"     type="string" />
                <element name="copyright"   type="string" />
                <element name="author"      type="string" />
			</choice>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<!--
		 Element definitions
	-->
	<complexType name="inline" mixed="true">
		<sequence minOccurs="0" maxOccurs="unbounded">
			<choice>
                <element name="acronym"           type="doc:inline" />
                <element name="anchor"            type="doc:inline" />
                <element name="author"            type="doc:inline" />
                <element name="citation"          type="doc:inline" />
                <element name="email"             type="doc:inline" />
                <element name="emphasis"          type="doc:inline" />
                <element name="footnote"          type="doc:footnote" />
                <element name="footnoteref"       type="doc:inline" />
                <element name="inlinemediaobject" type="doc:mediaobject" />
                <element name="literal"           type="doc:inline" />
                <element name="quote"             type="doc:inline" />
                <element name="subscript"         type="doc:inline" />
                <element name="superscript"       type="doc:inline" />
                <element name="link"              type="doc:link" />
                <element name="ulink"             type="doc:ulink" />
			</choice>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="ulink">
		<complexContent>
			<extension base="doc:inline">
				<attribute name="url" type="string" use="required" />
			</extension>
		</complexContent>
	</complexType>

	<complexType name="link">
		<complexContent>
			<extension base="doc:inline">
				<attribute name="linked" type="string" use="required" />
			</extension>
		</complexContent>
	</complexType>

	<complexType name="footnote">
		<sequence>
			<choice minOccurs="0" maxOccurs="unbounded">
				<group ref="doc:block" />
			</choice>
		</sequence>
		<attribute name="label" type="string" />
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="specialParagraph">
		<sequence>
			<choice minOccurs="0" maxOccurs="unbounded">
				<group ref="doc:block" />
			</choice>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="blockquote">
		<sequence>
			<element name="attribution" type="doc:inline" minOccurs="0" />
			<choice minOccurs="0" maxOccurs="unbounded">
				<group ref="doc:block" />
			</choice>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="literallayout">
		<simpleContent>
			<extension base="string">
				<attribute name="class">
					<simpleType>
						<restriction base="string">
							<enumeration value="monospaced" />
							<enumeration value="normal" />
						</restriction>
					</simpleType>
				</attribute>
			</extension>
		</simpleContent>
	</complexType>

	<complexType name="itemizedlist">
		<sequence maxOccurs="unbounded">
			<element name="listitem">
				<complexType>
					<choice minOccurs="0" maxOccurs="unbounded">
						<group ref="doc:block" />
					</choice>
				</complexType>
			</element>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="orderedlist">
		<sequence maxOccurs="unbounded">
			<element name="listitem">
				<complexType>
					<choice minOccurs="0" maxOccurs="unbounded">
						<group ref="doc:block" />
					</choice>
				</complexType>
			</element>
		</sequence>
		<attribute name="numeration">
			<simpleType>
				<restriction base="string">
					<enumeration value="arabic" />
					<enumeration value="loweralpha" />
					<enumeration value="lowerroman" />
					<enumeration value="upperalpha" />
					<enumeration value="upperroman" />
				</restriction>
			</simpleType>
		</attribute>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="variablelist">
		<sequence maxOccurs="unbounded">
			<element name="varlistentry">
				<complexType>
					<sequence>
						<element name="term" maxOccurs="unbounded" type="doc:inline" />
						<element name="listitem">
							<complexType>
								<choice minOccurs="0" maxOccurs="unbounded">
									<group ref="doc:block" />
								</choice>
							</complexType>
						</element>
					</sequence>
				</complexType>
			</element>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="mediaobject">
		<sequence>
			<choice minOccurs="0" maxOccurs="unbounded">
				<element name="imageobject" type="doc:imageobject" />
				<element name="textobject"  type="doc:textobject" />
				<element name="caption">
					<complexType>
						<sequence>
							<choice minOccurs="0" maxOccurs="unbounded">
								<group ref="doc:block" />
							</choice>
						</sequence>
						<attributeGroup ref="doc:common" />
					</complexType>
				</element>
			</choice>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="imageobject">
		<sequence>
			<element name="imagedata">
				<complexType>
					<attribute name="width" type="string" />
					<attribute name="srccredit" type="string" />
					<attribute name="contentdepth" type="string" />
					<attribute name="contentwidth" type="string" />
					<attribute name="scalefit" type="string" />
					<attribute name="align">
						<simpleType>
							<restriction base="string">
								<enumeration value="center" />
								<enumeration value="left" />
								<enumeration value="right" />
							</restriction>
						</simpleType>
					</attribute>
					<attribute name="valign">
						<simpleType>
							<restriction base="string">
								<enumeration value="bottom" />
								<enumeration value="middle" />
								<enumeration value="top" />
							</restriction>
						</simpleType>
					</attribute>
					<attribute name="depth" type="string" />
					<attribute name="fileref" type="string" />
					<attribute name="format" type="string" />
					<attribute name="scale" type="string" />
					<attributeGroup ref="doc:common" />
				</complexType>
			</element>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="textobject" mixed="true">
		<sequence>
			<choice minOccurs="0" maxOccurs="unbounded">
				<group ref="doc:block" />
			</choice>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="table">
		<sequence>
			<element name="tgroup">
				<complexType>
					<sequence>
						<element name="thead" type="doc:tablecontent" minOccurs="0" />
						<element name="tbody" type="doc:tablecontent" maxOccurs="unbounded" />
					</sequence>
				</complexType>
			</element>
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="tablecontent">
		<sequence maxOccurs="unbounded">
			<element name="row" type="doc:tablerow" />
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="tablerow">
		<sequence maxOccurs="unbounded">
			<element name="entry" type="doc:tablecell" />
		</sequence>
		<attributeGroup ref="doc:common" />
	</complexType>

	<complexType name="tablecell">
		<sequence>
			<choice minOccurs="0" maxOccurs="unbounded">
				<group ref="doc:block" />
			</choice>
		</sequence>
		<attribute name="morerows" type="int" />
		<attributeGroup ref="doc:common" />
	</complexType>

	<!--
		 Common elements
	-->
	<attributeGroup name="common">
		<attribute name="Arch" type="string" />
		<attribute name="Condition" type="string" />
		<attribute name="Conformance" type="string" />
		<attribute name="ID" type="ID" />
		<attribute name="Lang" type="string" />
		<attribute name="OS" type="string" />
		<attribute name="Remap" type="string" />
		<attribute name="Role" type="string" />
		<attribute name="Revision" type="string" />
		<attribute name="RevisionFlag" type="doc:revisionFlag" />
		<attribute name="Security" type="string" />
		<attribute name="UserLevel" type="string" />
		<attribute name="Vendor" type="string" />
		<attribute name="XrefLabel" type="string" />
	</attributeGroup>

	<group name="block">
		<choice>
			<element name="para"          type="doc:inline" />
			<element name="anchor"        type="doc:inline" />

			<element name="itemizedlist"  type="doc:itemizedlist" />
			<element name="orderedlist"   type="doc:orderedlist" />
			<element name="variablelist"  type="doc:variablelist" />

			<element name="caution"       type="doc:specialParagraph" />
			<element name="important"     type="doc:specialParagraph" />
			<element name="note"          type="doc:specialParagraph" />
			<element name="tip"           type="doc:specialParagraph" />
			<element name="warning"       type="doc:specialParagraph" />

			<element name="blockquote"    type="doc:blockquote" />
			<element name="mediaobject"   type="doc:mediaobject" />

			<element name="table"         type="doc:table" />
			<element name="literallayout" type="doc:literallayout" />
			<element name="comment"       type="string" />
			<element name="beginpage" />
		</choice>
	</group>

	<!--
		 Type definitions
	-->
	<simpleType name="revisionFlag">
		<restriction base="string">
			<enumeration value="Changed" />
			<enumeration value="Added" />
			<enumeration value="Deleted" />
			<enumeration value="Off" />
		</restriction>
	</simpleType>
</schema>