echo "<?php" > app/db/creds.php
echo "\$host = \"$(cd infra && terraform output db_endpoint)\";" >> app/db/creds.php
echo "\$user = \"root\";" >> app/db/creds.php
echo "\$pass = \"password\";" >> app/db/creds.php
echo "\$db = \"cloud\";" >> app/db/creds.php

    echo "\$db = new mysqli(\$host, \$user, \$pass, \$db);" >> app/db/creds.php

    echo "if (\$db->connect_error) { die(\"Connection failed: \" . \$db->connect_error);}" >> app/db/creds.php

echo "?>" >> app/db/creds.php
