import 'package:xml/xml.dart';

class ElbXmlHandler {
  const ElbXmlHandler._();

  static XmlDocument parseXmlFromString(String xmlContent) {
    return XmlDocument.parse(xmlContent);
  }

  static String getElementName(XmlElement element) {
    return element.name.toString();
  }

  static String getElementLocalName(XmlElement element) {
    return element.name.local;
  }

  static String getElementText(XmlElement element) {
    return element.innerText.trim();
  }

  static XmlElement getRootElement(XmlDocument document) {
    return document.rootElement;
  }

  static XmlElement? findFirstElement(
      XmlElement parentElement, String elementName) {
    return parentElement.findElements(elementName).firstOrNull;
  }

  static String? findFirstElementText(
      XmlElement parentElement, String elementName) {
    return parentElement
        .findElements(elementName)
        .firstOrNull
        ?.innerText
        .trim();
  }

  static XmlElement? getFirstElement(XmlDocument document, String elementName) {
    return document.findElements(elementName).firstOrNull;
  }
}
