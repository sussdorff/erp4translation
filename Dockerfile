FROM sussdorff/erp4projects

WORKDIR /var/www/openacs/packages

# Packages to overwrite
ENV PKGS_OLD_LIST "intranet-translation intranet-trans-invoices intranet-trans-project-wizard intranet-trans-trados intranet-trans-termbase intranet-trans-memoq"

RUN for pkg in ${PKGS_OLD_LIST} ; do echo $pkg \
    && rm -rf $pkg && wget -q https://gitlab.com/cognovis/$pkg/-/archive/master/$pkg.tar.gz \
    && tar xfz $pkg.tar.gz && mv ${pkg}-master-* $pkg && rm $pkg.tar.gz ; done

ENV DEPRECATE_LIST "sencha-assignment sencha-freelance-translation sencha-portal intranet-sencha-tables"

RUN for pkg in ${DEPRECATE_LIST} ; do echo $pkg \
    && rm -rf $pkg && wget https://gitlab.com/cognovis/$pkg/-/archive/master/$pkg.tar.gz \
    && tar xfz $pkg.tar.gz && mv ${pkg}-master-* $pkg && rm $pkg.tar.gz ; done