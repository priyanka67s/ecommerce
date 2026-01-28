class AppSettings {
  String? status;
  Settings? settings;

  AppSettings({this.status, this.settings});

  factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
        status: json['status'] as String?,
        settings: json['settings'] != null
            ? Settings.fromJson(json['settings'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'settings': settings?.toJson(),
      };
}

class Settings {
  WebSettings? websettings;
  GeneralSeo? generalseo;
  ColorSettings? colorSettings;
  List<GeneralFontFace>? generalfontface;
  FontSettings? fontSettings;

  Settings({
    this.websettings,
    this.generalseo,
    this.colorSettings,
    this.generalfontface,
    this.fontSettings,
  });

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        websettings: json['websettings'] != null
            ? WebSettings.fromJson(json['websettings'])
            : null,
        generalseo: json['generalseo'] != null
            ? GeneralSeo.fromJson(json['generalseo'])
            : null,
        colorSettings: json['color_settings'] != null
            ? ColorSettings.fromJson(json['color_settings'])
            : null,
        generalfontface: (json['generalfontface'] as List?)
            ?.map((e) => GeneralFontFace.fromJson(e))
            .toList(),
        fontSettings: json['font_settings'] != null
            ? FontSettings.fromJson(json['font_settings'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'websettings': websettings?.toJson(),
        'generalseo': generalseo?.toJson(),
        'color_settings': colorSettings?.toJson(),
        'generalfontface': generalfontface?.map((e) => e.toJson()).toList(),
        'font_settings': fontSettings?.toJson(),
      };
}

class WebSettings {
  int? id;
  String? sitetitle;
  int? websiteStatus;
  int? websiteType;
  String? websiteDescription;
  String? supportMail;
  String? supportContact;
  String? supportWhatsapp;
  String? packageName;
  String? subscriptionEndsAt;
  String? deploymentId;
  String? deploymentUserId;
  String? deploymentTokenId;
  String? deploymentOrgId;
  String? deploymentFrom;
  String? websiteurl;
  String? apiurl;
  String? vendorurl;
  String? websiteaddress;
  String? primaryLogo;
  String? lightPrimaryLogo;
  String? darkPrimaryLogo;
  String? logoWidth;
  String? logoHeight;
  String? favicon;
  int? multiCurrency;
  int? currencyUpdateMode;
  String? headerLink;
  String? footerLink;
  String? belowFooter;
  String? allDeviceCss;
  String? tabDeviceCss;
  String? mobDeviceCss;
  int? searchEngineVisiblity;
  String? productSlug;
  String? categorySlug;
  String? createdOn;
  String? updatedOn;

  WebSettings({
    this.id,
    this.sitetitle,
    this.websiteStatus,
    this.websiteType,
    this.websiteDescription,
    this.supportMail,
    this.supportContact,
    this.supportWhatsapp,
    this.packageName,
    this.subscriptionEndsAt,
    this.deploymentId,
    this.deploymentUserId,
    this.deploymentTokenId,
    this.deploymentOrgId,
    this.deploymentFrom,
    this.websiteurl,
    this.apiurl,
    this.vendorurl,
    this.websiteaddress,
    this.primaryLogo,
    this.lightPrimaryLogo,
    this.darkPrimaryLogo,
    this.logoWidth,
    this.logoHeight,
    this.favicon,
    this.multiCurrency,
    this.currencyUpdateMode,
    this.headerLink,
    this.footerLink,
    this.belowFooter,
    this.allDeviceCss,
    this.tabDeviceCss,
    this.mobDeviceCss,
    this.searchEngineVisiblity,
    this.productSlug,
    this.categorySlug,
    this.createdOn,
    this.updatedOn,
  });

  factory WebSettings.fromJson(Map<String, dynamic> json) => WebSettings(
        id: json['id'] as int?,
        sitetitle: json['sitetitle'] as String?,
        websiteStatus: json['website_status'] as int?,
        websiteType: json['website_type'] as int?,
        websiteDescription: json['website_description'] as String?,
        supportMail: json['support_mail'] as String?,
        supportContact: json['support_contact'] as String?,
        supportWhatsapp: json['support_whatsapp'] as String?,
        packageName: json['package_name'] as String?,
        subscriptionEndsAt: json['subscription_ends_at'] as String?,
        deploymentId: json['deployment_id'] as String?,
        deploymentUserId: json['deployment_user_id'] as String?,
        deploymentTokenId: json['deployment_token_id'] as String?,
        deploymentOrgId: json['deployment_org_id'] as String?,
        deploymentFrom: json['deployment_from'] as String?,
        websiteurl: json['websiteurl'] as String?,
        apiurl: json['apiurl'] as String?,
        vendorurl: json['vendorurl'] as String?,
        websiteaddress: json['websiteaddress'] as String?,
        primaryLogo: json['primary_logo'] as String?,
        lightPrimaryLogo: json['light_primary_logo'] as String?,
        darkPrimaryLogo: json['dark_primary_logo'] as String?,
        logoWidth: json['logo_width'] as String?,
        logoHeight: json['logo_height'] as String?,
        favicon: json['favicon'] as String?,
        multiCurrency: json['multi_currency'] as int?,
        currencyUpdateMode: json['currency_update_mode'] as int?,
        headerLink: json['header_link'] as String?,
        footerLink: json['footer_link'] as String?,
        belowFooter: json['below_footer'] as String?,
        allDeviceCss: json['all_device_css'] as String?,
        tabDeviceCss: json['tab_device_css'] as String?,
        mobDeviceCss: json['mob_device_css'] as String?,
        searchEngineVisiblity: json['search_engine_visiblity'] as int?,
        productSlug: json['product_slug'] as String?,
        categorySlug: json['category_slug'] as String?,
        createdOn: json['created_on'] as String?,
        updatedOn: json['updated_on'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sitetitle': sitetitle,
        'website_status': websiteStatus,
        'website_type': websiteType,
        'website_description': websiteDescription,
        'support_mail': supportMail,
        'support_contact': supportContact,
        'support_whatsapp': supportWhatsapp,
        'package_name': packageName,
        'subscription_ends_at': subscriptionEndsAt,
        'deployment_id': deploymentId,
        'deployment_user_id': deploymentUserId,
        'deployment_token_id': deploymentTokenId,
        'deployment_org_id': deploymentOrgId,
        'deployment_from': deploymentFrom,
        'websiteurl': websiteurl,
        'apiurl': apiurl,
        'vendorurl': vendorurl,
        'websiteaddress': websiteaddress,
        'primary_logo': primaryLogo,
        'light_primary_logo': lightPrimaryLogo,
        'dark_primary_logo': darkPrimaryLogo,
        'logo_width': logoWidth,
        'logo_height': logoHeight,
        'favicon': favicon,
        'multi_currency': multiCurrency,
        'currency_update_mode': currencyUpdateMode,
        'header_link': headerLink,
        'footer_link': footerLink,
        'below_footer': belowFooter,
        'all_device_css': allDeviceCss,
        'tab_device_css': tabDeviceCss,
        'mob_device_css': mobDeviceCss,
        'search_engine_visiblity': searchEngineVisiblity,
        'product_slug': productSlug,
        'category_slug': categorySlug,
        'created_on': createdOn,
        'updated_on': updatedOn,
      };
}

class GeneralSeo {
  int? seoGeneralId;
  String? sitetitle;
  String? companyOrPerson;
  String? metaSeperator;
  String? googleConsoleMeta;
  String? bingConsoleMeta;
  String? yandexConsoleMeta;
  String? googleAnalyticsCode;
  String? googleTagmanagerCode;
  String? facebookPixelCode;
  String? createdtime;
  String? updatedtime;

  GeneralSeo({
    this.seoGeneralId,
    this.sitetitle,
    this.companyOrPerson,
    this.metaSeperator,
    this.googleConsoleMeta,
    this.bingConsoleMeta,
    this.yandexConsoleMeta,
    this.googleAnalyticsCode,
    this.googleTagmanagerCode,
    this.facebookPixelCode,
    this.createdtime,
    this.updatedtime,
  });

  factory GeneralSeo.fromJson(Map<String, dynamic> json) => GeneralSeo(
        seoGeneralId: json['seo_general_id'] as int?,
        sitetitle: json['sitetitle'] as String?,
        companyOrPerson: json['company_or_person'] as String?,
        metaSeperator: json['meta_seperator'] as String?,
        googleConsoleMeta: json['google_console_meta'] as String?,
        bingConsoleMeta: json['bing_console_meta'] as String?,
        yandexConsoleMeta: json['yandex_console_meta'] as String?,
        googleAnalyticsCode: json['google_analytics_code'] as String?,
        googleTagmanagerCode: json['google_tagmanager_code'] as String?,
        facebookPixelCode: json['facebook_pixel_code'] as String?,
        createdtime: json['createdtime'] as String?,
        updatedtime: json['updatedtime'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'seo_general_id': seoGeneralId,
        'sitetitle': sitetitle,
        'company_or_person': companyOrPerson,
        'meta_seperator': metaSeperator,
        'google_console_meta': googleConsoleMeta,
        'bing_console_meta': bingConsoleMeta,
        'yandex_console_meta': yandexConsoleMeta,
        'google_analytics_code': googleAnalyticsCode,
        'google_tagmanager_code': googleTagmanagerCode,
        'facebook_pixel_code': facebookPixelCode,
        'createdtime': createdtime,
        'updatedtime': updatedtime,
      };
}

class ColorSettings {
  int? id;
  String? primaryColor;
  String? secondaryColor;
  String? globalColor;
  String? baseColor;
  String? infoColor;
  String? alertColor;
  String? successColor;
  String? warningColor;
  String? linkHoverColor;
  String? linkColor;
  String? dividerColor;
  String? darkColor;
  String? createdAt;
  String? updatedAt;

  ColorSettings({
    this.id,
    this.primaryColor,
    this.secondaryColor,
    this.globalColor,
    this.baseColor,
    this.infoColor,
    this.alertColor,
    this.successColor,
    this.warningColor,
    this.linkHoverColor,
    this.linkColor,
    this.dividerColor,
    this.darkColor,
    this.createdAt,
    this.updatedAt,
  });

  factory ColorSettings.fromJson(Map<String, dynamic> json) => ColorSettings(
        id: json['id'] as int?,
        primaryColor: json['primary_color'] as String?,
        secondaryColor: json['secondary_color'] as String?,
        globalColor: json['global_color'] as String?,
        baseColor: json['base_color'] as String?,
        infoColor: json['info_color'] as String?,
        alertColor: json['alert_color'] as String?,
        successColor: json['success_color'] as String?,
        warningColor: json['warning_color'] as String?,
        linkHoverColor: json['link_hover_color'] as String?,
        linkColor: json['link_color'] as String?,
        dividerColor: json['divider_color'] as String?,
        darkColor: json['dark_color'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'primary_color': primaryColor,
        'secondary_color': secondaryColor,
        'global_color': globalColor,
        'base_color': baseColor,
        'info_color': infoColor,
        'alert_color': alertColor,
        'success_color': successColor,
        'warning_color': warningColor,
        'link_hover_color': linkHoverColor,
        'link_color': linkColor,
        'divider_color': dividerColor,
        'dark_color': darkColor,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}

class GeneralFontFace {
  int? fontId;
  int? fontType;
  String? fontName;
  String? fontFamily;
  String? googleUrl;
  String? fontStyle;
  String? fontWeight;
  String? fontDisplay;
  String? woffUrl;
  String? woff2Url;
  String? svgUrl;
  String? eotUrl;
  String? fontCreated;
  String? fontModified;

  GeneralFontFace({
    this.fontId,
    this.fontType,
    this.fontName,
    this.fontFamily,
    this.googleUrl,
    this.fontStyle,
    this.fontWeight,
    this.fontDisplay,
    this.woffUrl,
    this.woff2Url,
    this.svgUrl,
    this.eotUrl,
    this.fontCreated,
    this.fontModified,
  });

  factory GeneralFontFace.fromJson(Map<String, dynamic> json) =>
      GeneralFontFace(
        fontId: json['font_id'] as int?,
        fontType: json['font_type'] as int?,
        fontName: json['font_name'] as String?,
        fontFamily: json['font_family'] as String?,
        googleUrl: json['google_url'] as String?,
        fontStyle: json['font_style'] as String?,
        fontWeight: json['font_weight'] as String?,
        fontDisplay: json['font_display'] as String?,
        woffUrl: json['woff_url'] as String?,
        woff2Url: json['woff2_url'] as String?,
        svgUrl: json['svg_url'] as String?,
        eotUrl: json['eot_url'] as String?,
        fontCreated: json['font_created'] as String?,
        fontModified: json['font_modified'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'font_id': fontId,
        'font_type': fontType,
        'font_name': fontName,
        'font_family': fontFamily,
        'google_url': googleUrl,
        'font_style': fontStyle,
        'font_weight': fontWeight,
        'font_display': fontDisplay,
        'woff_url': woffUrl,
        'woff2_url': woff2Url,
        'svg_url': svgUrl,
        'eot_url': eotUrl,
        'font_created': fontCreated,
        'font_modified': fontModified,
      };
}

class FontSettings {
  int? fontSettingsId;
  String? bodyFont;
  String? paraFont;
  String? h1Font;
  String? h2Font;
  String? h3Font;
  String? h4Font;
  String? h5Font;
  String? h6Font;
  String? linkFont;
  String? buttonFont;
  String? fontCreated;
  String? fontModified;

  FontSettings({
    this.fontSettingsId,
    this.bodyFont,
    this.paraFont,
    this.h1Font,
    this.h2Font,
    this.h3Font,
    this.h4Font,
    this.h5Font,
    this.h6Font,
    this.linkFont,
    this.buttonFont,
    this.fontCreated,
    this.fontModified,
  });

  factory FontSettings.fromJson(Map<String, dynamic> json) => FontSettings(
        fontSettingsId: json['font_settings_id'] as int?,
        bodyFont: json['body_font'] as String?,
        paraFont: json['para_font'] as String?,
        h1Font: json['h1_font'] as String?,
        h2Font: json['h2_font'] as String?,
        h3Font: json['h3_font'] as String?,
        h4Font: json['h4_font'] as String?,
        h5Font: json['h5_font'] as String?,
        h6Font: json['h6_font'] as String?,
        linkFont: json['link_font'] as String?,
        buttonFont: json['button_font'] as String?,
        fontCreated: json['font_created'] as String?,
        fontModified: json['font_modified'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'font_settings_id': fontSettingsId,
        'body_font': bodyFont,
        'para_font': paraFont,
        'h1_font': h1Font,
        'h2_font': h2Font,
        'h3_font': h3Font,
        'h4_font': h4Font,
        'h5_font': h5Font,
        'h6_font': h6Font,
        'link_font': linkFont,
        'button_font': buttonFont,
        'font_created': fontCreated,
        'font_modified': fontModified,
      };
}
