PGDMP     :    1                v            tokendb    9.4.10    10.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16385    tokendb    DATABASE     e   CREATE DATABASE tokendb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE tokendb;
             token    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    11855    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16386    id_task_data_seq    SEQUENCE     r   CREATE SEQUENCE id_task_data_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.id_task_data_seq;
       public       token    false    7            �            1259    16388    id_task_history_seq    SEQUENCE     u   CREATE SEQUENCE id_task_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.id_task_history_seq;
       public       token    false    7            �            1259    16390    id_wallets_seq    SEQUENCE     p   CREATE SEQUENCE id_wallets_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.id_wallets_seq;
       public       token    false    7            �            1259    16453 
   new_wallet    TABLE     �   CREATE TABLE new_wallet (
    id_new_wallet integer,
    address_wallet character varying,
    private_key character varying
);
    DROP TABLE public.new_wallet;
       public         token    false    7            �            1259    16392 	   task_data    TABLE     z  CREATE TABLE task_data (
    id_task_data integer DEFAULT nextval('id_task_data_seq'::regclass) NOT NULL,
    from_csv text,
    id_task character varying,
    put_date date,
    count_address integer,
    amount_token numeric,
    active_task boolean,
    number_times numeric,
    real_number_times numeric,
    remain_number numeric,
    current_tx_hash character varying
);
    DROP TABLE public.task_data;
       public         token    false    173    7            �            1259    16399    task_history    TABLE     �   CREATE TABLE task_history (
    id_task_history integer DEFAULT nextval('id_task_history_seq'::regclass) NOT NULL,
    id_task character varying,
    status character varying,
    id_wallet integer,
    start_date date,
    end_date date
);
     DROP TABLE public.task_history;
       public         token    false    174    7            �            1259    16406    transfer_history_id_seq    SEQUENCE     y   CREATE SEQUENCE transfer_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.transfer_history_id_seq;
       public       token    false    7            �            1259    16408    transfer_history    TABLE     �   CREATE TABLE transfer_history (
    id integer DEFAULT nextval('transfer_history_id_seq'::regclass) NOT NULL,
    number_times numeric,
    id_task character varying,
    time_transfer date,
    th_hash character varying,
    sended_tokens text
);
 $   DROP TABLE public.transfer_history;
       public         token    false    178    7            �            1259    16421    wallet    TABLE     �   CREATE TABLE wallet (
    id_wallet integer DEFAULT nextval('id_wallets_seq'::regclass) NOT NULL,
    id_wordpress integer,
    address_wallet character varying(42),
    private_key character varying(64)
);
    DROP TABLE public.wallet;
       public         token    false    175    7            �          0    16453 
   new_wallet 
   TABLE DATA                     public       token    false    181   d       �          0    16392 	   task_data 
   TABLE DATA                     public       token    false    176   ~       �          0    16399    task_history 
   TABLE DATA                     public       token    false    177   q-       �          0    16408    transfer_history 
   TABLE DATA                     public       token    false    179    .       �          0    16421    wallet 
   TABLE DATA                     public       token    false    180   �9       �           0    0    id_task_data_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('id_task_data_seq', 33, true);
            public       token    false    173                        0    0    id_task_history_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('id_task_history_seq', 3, true);
            public       token    false    174                       0    0    id_wallets_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('id_wallets_seq', 3, true);
            public       token    false    175                       0    0    transfer_history_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('transfer_history_id_seq', 911, true);
            public       token    false    178            y           2606    16427    task_data task_data_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY task_data
    ADD CONSTRAINT task_data_pkey PRIMARY KEY (id_task_data);
 B   ALTER TABLE ONLY public.task_data DROP CONSTRAINT task_data_pkey;
       public         token    false    176            {           2606    16429    task_history task_history_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id_task_history);
 H   ALTER TABLE ONLY public.task_history DROP CONSTRAINT task_history_pkey;
       public         token    false    177            ~           2606    16431 &   transfer_history transfer_history_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY transfer_history
    ADD CONSTRAINT transfer_history_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.transfer_history DROP CONSTRAINT transfer_history_pkey;
       public         token    false    179            �           2606    16449    wallet wallets_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY wallet
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id_wallet);
 =   ALTER TABLE ONLY public.wallet DROP CONSTRAINT wallets_pkey;
       public         token    false    180            |           1259    16434    id    INDEX     =   CREATE UNIQUE INDEX id ON transfer_history USING btree (id);
    DROP INDEX public.id;
       public         token    false    179            �   
   x���          �   �  x���K�f�q������ZE�X$�^ ��	����)����y(�9:Hϵ�,��^x���_��o}��w�ח�����~�/��~����^_֧�>��o?�������}���8__�O_~�����i����ԏ�|����|�?����=?~�������8��O�~x�ۗ>����E*��i�Z�x�����߿����۟���^_����~��}�/�����Ri���4��7��~%��-�Yz�^��\?|���x+v�X�����7�je��|p3V+����~{?�w3���)�cR��KS���j�K�&�ť�9�����\ι �B���6��hO3�����
��[��J٬��YX�����D�[Ρ���:K��ܻ�r����!Dw/�CU��b�)Y=�֩%������\Οʱ������G��=�J���W7�]Gb��{����y��;���l%��t!��Mc��Mg��r�=�ڻ;��l���X��f�T��[��&�66{�E�4/�.Ŝ���kͬKCO��z����3��/�$I@�L=��������j�s�����&҆/���ݧ�ZZ�B"l0N�<YH�V�P-����d�Ҫy^�}E]G�Zo��*`-Vm��)�7�!�R��B��2�(n9*�TM�
�i`h$�:����	0�9�欞f1C�*I�-]�e�]�8΅~�#<c��r��G�JM�����K�s��z�r=��ҭP�LRNe� 0�`	 ���� ���)����>1�A�.��k�]��5��X@�Y���h���6��2����m�5���"u�	��9��k^��i���~�tM��p���!�ř��J
���q*��t�p�~�K���>E��
s2a�)�
E�-	��������dgs��M�ZI���k��	� �P�Z��Y.���C�3�k^�p%iW�:%��r�s�Y�]
ъ�DMw��>,�UF�h���'��H�2���;�q.�4L�;�}�L�R���K~M&�F��e�~.<+:D-߷Yų����ǘ+�����������
N
����[�]$|H.3��4��s:��S9x��� �[5���D�v����J���15�b ���'�H��9����QK�+�ТĲ�X��q0eq��f�RN�ɿ��,6�D	���p�k����3`>��.:��?���k��S� ��j.�¬��������'�OXCR����`rR���z^�y��Z8�t?��X�`�t�b*`:����Y�c'z)�\9L���9��Zs�G��v�X�_�Bu2��<�\�Y��7�=�O�n���/�a~B#(BZ��y��w)��'2ʿ��Np��2�Wj����pai�s^�9��N�''�N_L����7ܝDΟ%�\Gk��91�P�^ѬY�Y�!0�W�[w	��q�emq��Q�íC��� ��
�l痡ML�8�� (�r.#ˇ��x�9[VV4��Sѩ�9�m���~�k9�{�R�}u�n�0�����0�q- 2q��+l�T.�K�a�5��� �D$�����-[ʈĦ�6㕳���L��a$F�F^Y=��x��EYxxò��P�$^�iA��y��R���1�Y7�[c#��PZ�K-��Q�ꬕ!�)�0E��H����1(�����w̩�~�^�EG�03��_�͐:S�"���TC�� 5����67R �(��; آ�!����.� 	gJn������^Aij��+S���b�7��%�P�#��ܷ:F<3�^��8Ć'#K�}O	_=�Y��@��sm�Orm"�ɢ2g���꟦u���\v)�����e�}��U�@��D�%�G�5����S��8��y֭�e�7��V�ʮR!�ˑf;uz?����0�&�����Oơ'C��_s] ���O���u��N �sn��`�Q��^����q��:����3�Z��5�_�n��8o�ϼ���+j7'3�n9��,�N2u���?�Z��H�<x���`�c�:Kӡ97�� �d�Ʊ�۵c�j<E�p�1�����k���&8�}�r]]$;�r��$��aP{B�3��R��=a}��vɐ�"���h��w���BZ�@ �&�iz�k���d�x�.$��xEl �i��)�����d]2V��>����b@���0�,����رp-����{�R[D�Q��7����e�Z�~B~�R. �;�=�-�^�LZuc�� r8�H��e��r䐄�����Qa���#젊Q'� �����?b��d�8���4%����0�k%*Zq-ǐ=ɪ�m�H��N�G�󀩨��Q�@ͮwvs̄{�KU{�#�^�Ɖ����`b����r�%�6)��61��p
�jK���.�́�d�;����bG8&2��ô[�q��f�RkU���u��p��/�.R��=�M"O����;���c��PP�]��	�by]~� �F2��כKca0\����f)��Dh�>]�r$.��[�C�.���Y��i��K�Yq� @���.߉�$7>�0�r���sx�e���')#O�
5ӽW�-� �e��X�8 r�[�փڻ���љ���y��`L���t�i��L}94�RþB�R��~��M7�>BF�c�g�n�;X��\c!	��h:b����J�"��|���@�(�U�̸��5A����\��H��\��s!�h2?D�\Aq n���"bd ���ٖ���1���'�_<fy[AﻒZ�D��[MGrP��y���6��2<8�P��U\�5y��+Bi��N��r�A��p-E��W�B��Ck�G�p�E���3�f���7Orϱ��]��A�Q
�2�L���t��}9$m;��﫳��s#��M,?�w�\!��#x��p���.g������O�G�p����wΝ�/㎱H�#���k�bI'J&g��c��p_�ծ���o�AH9���B�������!��$D�6���a�r��������4��e?=�Dq�f��2Y768��-��"���F&]K�Fa�GN��xc�����Z�H���F��ub�sk��}�JR���!�T����EF)��d��r9�
�$��_��.�h<>�@�J\Ŋ1��}�g��y�-|%�ym\���&~c��9J�#��vCKx���q̀���,���0	��8&�ԯ��9:L�z���􌰔�.�L��ӝ�4�$�p)Ψ�ÿ���|��q��\��^n��`j�;����a%k���t.:�<Hs�:��r�Vc���5TX>m��[�j�Rn߼;���q� -X�i��Y	CJhu�5G�"��⹜��*1�3�8h"���f�!lʎF������.<\�C`�pDR�o�T�Gl	�>[�2��ˡP+��˧�V�x7o��C#&���ϥD=�����>�t, �^�s�f�
I��K���y���  �B�c�^Z���c�'�J����}�G���&�Da��n�P��l�F�ԉ2�s:���4�G+�싡�&����T�u��o�(M�(T��ʣ�V@���r���r���BD�u�����$�vy<��(�{| ���,�}]xL�E��GQs����So�vw�+`�~���ճYJb���r����dq�������o�����Ç��ᛷ��6��~ً��H��{>��^_�� ��{�S��֌������m�-�/������������W_}�����      �      x�MȽ
�0��=W�mm!���С"؟5�$ŒP!�+��[R���N��c�Nwb�h���?T/����H[�P�mS
\(�񖃤����njl{�/�*8����	��gT;�m�s��G��m�B�/��2      �   �  x���K�����������Z]���`�)�l��Tɖ�H�#E��y�س������V����?�|������������w�_?���^�z߼|��ϛ�}z����yy�~Z�޼��o߾{�n��{��j�q�������o������f�o^қ�/_���������7���z��K~\R�o�~SJ|�~�]��v���XiE�l��يY�T��귮ڪ�i9�;n-���눧�7�V��=VV��Kneg����Qdd���7]��{t���/��T)�'/_��)ٔ���hn��%ij*���-���g���9�[Dk�����ΰ\n�]'g={���d��V��CS�e�r��e����ꌣ����}��7���R��J�d���ў_�>�\=~�[�;x�Y
u6n�$
��O{�\��٭�~�e)��9��99�j��g���Uv_c��6o��93��K�Q�歞A����rMm���,�6Ҡ��Z<Ջ������֎���o������y��ʥ�����%�okS��9E��_j=�.k����%���ݘ��g������;��xMKR��s�4���[4�d�y��B�̗�����y�Jq����ѽ��wpb�}m�}V����&��hdCǼ��D�=���k��ݾhTQy0�YK����ӎ_�
l�����Q�_)���i�Ǳ[��UK�����x�=pt�Ϙv%�V�5�}��<���E]�{��r2�a�����)��uc�V�'p��u�p��40��׏�x��떺䓸��4�2F��fn6e��sE�ϻRn��i ��*--����ɐ�J��c@*9i�Ꝍ�WEO�u��Bej�eÏs��^mvU����r�T�gW~M�O�i�z״a]���E~8
��h�v2Bq�O��٧k��)Lh�"9w��}��N}:%V���g�l��F�6�4k*� ��[B��P%��S���3�Ԙ��
(�h�'� �kw9������Z�퉑����|���g^�9�w��,�Fer%����ԞP�%��=��nF��O�4��P��.c��`0�+XB��ZՆ2̔�E��x�e�m�K���6ߨ1�T�M,㑌��ZV&������ޤ𴭳��B��K:��7�(_�^o��*Lgڣ.���v�zݹ)dY:��2�bv�+j�Y\�E��(Y��]B37�����˯���w�1g\9�qc6�H_m�����FNI`��<Hv'�v��ۦ&�P������ ~�8��vw�`��M:��z�e�U�{i�1o���$�9C��R���PZ�!�!=9f�ĺ辷���h��J�@���ކ{b����!��=�-0e���.�M�� '��Ƚ�<�X�����Hhvk��:�/��� �@2B�ӄ�=e���h��oj�uB�h�j�,Z8�Lp������;f��d�bm�U��qV'(���N����S�J#oC����@WCkM�r2D5�F�\f�(�u���@ziBĈ���l.�B��t�q��Z�4"9pt����$��>�0	���rjq�G�	X5��I��-�����Nx^���c;���L`���q�� g�[�g]��3�nXQ3��P�������Bpy�5"���6Ս�`��$% b7��gZ�Պv�V'� =8*����Ǔ7G�Nlx�L��i�!������bH)��a�lE��X�m*�o%az-��$��#Jo!3�68��k�D�	�*r_Q��F��`�*ċ��	��$�W�Ҏ��ig��"b�fߵ��}�pF�A �MFIP)m�3�㾝 ��0{}!rK�mk���Z#�`��;�CH�!��F��u1�6F�+Q`3wL�\J�/�G��؅eb�%��T�����Y~cZ� �"S�}��3���gzl鐩��^{T�b��ow��`�6�k	͢�g�(m���dY��X �5�Z�a��=f��"�"�D�0�K�``f�8 䩵�Ä0}�,�bo:7O��!�#�qd�
f� ��=W�g!l$o�K��4�܌z9�1�	��2&�vRSExQ�`�UK��:���!�LP��.�۱L�}��4��L7@-(8Y�
�nR˲�Sk���i��q�<:{���%[�D�N��,�"YB�3{��8Q.C��ڹa��2��}��Qº`PPh���O����O�%A1[GX4s��x���˟l̸r��ƌ8��xY��cVHL����l�{���A,r�4c�P��=V���1/V�^0��RX���l�[k��Z��n.��p���E�
	Tb�a}��,0VA0�G�ڎy����l�0RzA=ZМ9�+�!#	Ӛ91#��(���k��^aEg����Z7���wQ��	σ��h��p�F���y&��M�������Wt-Ӫ��B*�dF fkna�-�w8�Q���gBď�6)H؅���t7
��R�i�pl�J�L8A���[;���\�ʑ���ޡ�J�n I\���<;+%�O�����"��V6'/z1�8�: S�G�%�/V�m/�gAo=>>y��F�F�@���o���7�����Vv�����b�f�굑V,�=�ю��+��4�<US]��<ҴAc�aC�F���$�
���n����"f@���HT���a4����ٙ�mW:4{ ��
�:1BnqV��@�d@8����S ���?�g.�a�M<LG$&$�(K�F�6�/�hbS�O��H���T�f?���)e	]������e����MC�/u�ʃ}c�k���Sa�,�ݜ#?�I�QO,&��Q�.�jdF�V�}��^+;n���2x:�(���3�4p��Y�{X���x�<��	pN�a�d �z��q�.��	����yl�xD|z@_��/6{��)�%��F}��zR�@�����Z�i3`gecY��U���h�l���_|�!�      �   �   x�=��
�0@�}�bv��E�v�Wi:A|mK4Ă�->�^Epw���jK�,V�5<|��	f����×�!�C�|_�k?\�~��5�28�垶0+r�9��^�2��*�JyL#��g*΢D]V�禦t����)g�V;��pK�;rR*�*#
i*a���Ӣ�-��<I�7�e9b     