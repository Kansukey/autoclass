#!/bin/bash -e

clear

echo | cat <<EOF

############################################
#                                          #
#         C++ AUTO CLASS GENERATOR         #
#   https://github.com/Kansukey/autoclass  #
#          Made with pleasure (:           #
#                                          #
############################################

EOF

# Get all elements required
echo -e "> Class name :"
read -e className

# Ask for default includes
echo -e "\n> Do you want to browse the default include list ? (Y/n)"
read -e defaultInc

if [ "$defaultInc" != n ] ; then
    echo -e ">> iostream   (Y/n)" ; read -e Liostream
    echo -e ">> string     (Y/n)" ; read -e Lstring
    echo -e ">> fstream    (Y/n)" ; read -e Lfstream
fi

# Check if file already exists
if [ -a $className.hh ] ; then
    echo -e "[ERROR]: Your file $className.hh already exists! exit."
    exit 1;
elif [ -a $className.cpp ] ; then
    echo -e "[ERROR]: Your file $className.cpp already exists! exit."
    exit 1;
fi

# Header File
echo -e "> Starting to create the header file of your class $className..."
cat > $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}.hh <<EOF
//
// Header coming soon
//

#ifndef $(echo "$className" | tr '[:lower:]' '[:upper:]')_HH_
# define $(echo "$className" | tr '[:lower:]' '[:upper:]')_HH_

EOF

# Include part
if [ "$Liostream" != n ] ; then echo "#include <iostream>" >> $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}.hh ; fi
if [ "$Lstring" != n ] ; then echo "#include <string>" >> $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}.hh ; fi
if [ "$Lfstream" != n ] ; then echo "#include <fstream>" >> $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}.hh ; fi

# Here we go, let's add the content
cat >> $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}.hh <<EOF

class	$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1} {

 public:
  $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}(void);
  $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}(const $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1} &);
  ~$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}(void);

  $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}		&operator=($(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1} const &);
};

#endif /* !$(echo "$className" | tr '[:lower:]' '[:upper:]')_HH_ */

EOF
# End of header file

echo -e "\e[92m> Done.\e[39m"


# Source file now
echo -e "\n> Starting to create the source file of your class $className..."

cat > $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}.cpp <<EOF
//
// Header coming soon
//

#include "$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}.hh"

$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}::$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}(void)
{ }

$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}::$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}(const $(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1} &other)
{ }

$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}::~$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}(void)
{ }

$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}	&$(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1}::operator=($(echo "$className" | tr '[:lower:]' '[:upper:]' <<< ${className:0:1})${className:1} const &other)
{
  if (this != &other)
    {
      ;// Do things
    }
  return (*this);
}

EOF
echo -e "\e[92m> Done.\e[39m"
