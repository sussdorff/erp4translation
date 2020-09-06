FROM sussdorff/erp4projects

WORKDIR /var/www/openacs/packages

# Packages to overwrite
ENV PKGS_OLD_LIST "intranet-translation intranet-trans-invoices intranet-trans-project-wizard intranet-trans-trados intranet-trans-termbase intranet-trans-memoq intranet-freelance intranet-freelance-translation intranet-freelance-invoices"

RUN for pkg in ${PKGS_OLD_LIST} ; do echo $pkg \
    && rm -rf $pkg && wget -q https://gitlab.com/cognovis/$pkg/-/archive/master/$pkg.tar.gz \
    && tar xfz $pkg.tar.gz && mv ${pkg}-master-* $pkg && rm $pkg.tar.gz ; done

ENV DEPRECATE_LIST "sencha-assignment sencha-freelance-translation sencha-portal"

RUN for pkg in ${DEPRECATE_LIST} ; do echo $pkg \
    && rm -rf $pkg && wget -q https://gitlab.com/cognovis/$pkg/-/archive/master/$pkg.tar.gz \
    && tar xfz $pkg.tar.gz && mv ${pkg}-master-* $pkg && rm $pkg.tar.gz ; done

ENV DEPRECATE_50_LIST "intranet-sencha-tables"

RUN for pkg in ${DEPRECATE_50_LIST} ; do echo $pkg \
    && rm -rf $pkg && wget -q https://gitlab.com/cognovis/$pkg/-/archive/oacs-5-10/$pkg.tar.gz \
    && tar xfz $pkg.tar.gz && mv ${pkg}-oacs-5-10-* $pkg && rm $pkg.tar.gz ; done